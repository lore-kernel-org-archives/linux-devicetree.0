From: beagleboard@davidjohnsummers.uk
Subject: Re: [PATCHv2] Patch to add the realtek bluetooth device tree refs to
 the code
Date: Sat, 19 Jan 2019 13:18:56 +0000
Message-ID: <4b098970-9644-12b4-c6f1-2e66ffbe24fa@davidjohnsummers.uk>
References: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-2-beagleboard@davidjohnsummers.uk>
 <510BE8B9-76BD-4A64-86C2-ACA1D50819DF@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <510BE8B9-76BD-4A64-86C2-ACA1D50819DF@holtmann.org>
Content-Language: en-PH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,

Yes have been having an email conversation with Rob on the device tree 
email list.

he wants minor changes to the naming, which i agree with. So have much 
of a revised patch set read to send in. Just need to check some things.

Hopefully be able to send later this weekend, and it will replace the 
patch below.

Thanks,

David.

On 18/01/2019 10:57, Marcel Holtmann wrote:
> Hi David,
>
>> This patch adds the necessary device tree hooks to the realtek
>> bluetooth driver for serial connections.
>>
>> The realtek devices that are listed btrtl.c are searched on the
>> realtek web site for the version that have serial connections.
>>
>> Most of these devices also have wi-fi connected via sdio, that is not
>> covered by the bluetooth driver - but as that interface will also be
>> needed in the device tree, the hocks here have "-bluetooth" added. The
>> exception to this is the rtl8761atv, which only has a serial
>> bluetooth.
>>
>> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
>> ---
>> drivers/bluetooth/hci_h5.c | 16 ++++++++++++++++
>> 1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
>> index 8eede1197cd2..2fec7ff2ce7c 100644
>> --- a/drivers/bluetooth/hci_h5.c
>> +++ b/drivers/bluetooth/hci_h5.c
>> @@ -925,6 +925,22 @@ static struct h5_vnd rtl_vnd = {
>> };
>> #endif
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id h5_of_match[] = {
>> +#ifdef CONFIG_BT_HCIUART_RTL
>> +       { .compatible = "realtek,rtl8723as-bluetooth"},
>> +       { .compatible = "realtek,rtl8723bs-bluetooth"},
>> +       { .compatible = "realtek,rtl8723ds-bluetooth"},
>> +       { .compatible = "realtek,rtl8761atv"},
>> +       { .compatible = "realtek,rtl8821as-bluetooth"},
>> +       { .compatible = "realtek,rtl8821cs-bluetooth"},
>> +       { .compatible = "realtek,rtl8822bs-bluetooth"},
>> +#endif
> I really need an Ack from Rob on the naming here.
>
> Regards
>
> Marcel
>
