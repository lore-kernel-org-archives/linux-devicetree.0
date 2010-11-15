From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: [PATCH 2/2] powerpc: pcm030/032: add pagesize to dts
Date: Mon, 15 Nov 2010 11:06:44 -1000
Message-ID: <4CE1A0E4.5030505@firmworks.com>
References: <1289841916-3825-1-git-send-email-w.sang@pengutronix.de>	<1289841916-3825-2-git-send-email-w.sang@pengutronix.de>
	<20101115173250.GA22104@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20101115173250.GA22104@oksana.dev.rtsoft.ru>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

On 11/15/2010 7:32 AM, Anton Vorontsov wrote:
> On Mon, Nov 15, 2010 at 06:25:16PM +0100, Wolfram Sang wrote:
>> Signed-off-by: Wolfram Sang<w.sang@pengutronix.de>
>> ---
>>   arch/powerpc/boot/dts/pcm030.dts |    1 +
>>   arch/powerpc/boot/dts/pcm032.dts |    3 ++-
>>   2 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/dts/pcm030.dts b/arch/powerpc/boot/dts/pcm030.dts
>> index 8a4ec30..e7c36bc 100644
>> --- a/arch/powerpc/boot/dts/pcm030.dts
>> +++ b/arch/powerpc/boot/dts/pcm030.dts
>> @@ -259,6 +259,7 @@
>>   			eeprom@52 {
>>   				compatible = "catalyst,24c32";
>>   				reg =<0x52>;
>> +				pagesize =<32>;
>
> I think you'd better drop the pagesize property altogether, and
> instead make the compatible string more specific (if needed at
> all. are there any 'catalyst,24c32' chips with pagesize != 32?)


Microchip makes a 24c32 part that looks pretty similar to the catalyst 
part, but Microchip's has a 64-byte page size compared to Catalyst's 32.

It would probably be feasible to have a generic I2C EEPROM driver that 
could handle many different parts, parameterized by total size, block 
size, and page size.


>
> Thanks,
>
