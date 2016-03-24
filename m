From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: dts: sun8i: Base Orange Pi Plus
 dts on the Orange Pi 2 dts
Date: Thu, 24 Mar 2016 12:15:52 +0100
Message-ID: <56F3CC68.4010705@redhat.com>
References: <1458771256-4069-1-git-send-email-hdegoede@redhat.com>
 <20160324075904.GU30977@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160324075904.GU30977@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On 24-03-16 08:59, Maxime Ripard wrote:
> Hi,
>
> On Wed, Mar 23, 2016 at 11:14:16PM +0100, Hans de Goede wrote:
>> The Orange Pi Plus really is an Orange Pi 2 extended with:
>> 1) A sata <-> usb bridge connected to ehci3
>> 2) An eMMC on mmc2
>> 3) An external gigabit ethernet phy instead of the integrated 100Mbit phy
>>
>> This commit changes the dts to reflect this by making it include
>> the Orange Pi 2 dts and then adding the extra bits.
>>
>> Note that the difference in ethernet phy is not taken into account
>> because we do not have an ethernet driver for the H3 yet.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Unfortunately, the patch doesn't apply anymore, and the merge doesn't
> seem trivial.
>
> I pushed my branch on my kernel.org repo, can you rebase your patch on
> top and resend it?

The problem is that you forgot to apply:
"ARM: dts: sun8i: Orangepi plus gpio keys fixes and improvements"

With that applied this one should apply unchanged too.

Regards,

Hans
