From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: sun8i: a83t: Drop leading zeroes
 from device node addresses
Date: Tue, 18 Apr 2017 17:22:02 +0800
Message-ID: <CAGb2v664r+Wt9zrSK2GudMYRkp9N+QpdbEMdWEobx-HxS38Ovw@mail.gmail.com>
References: <20170418042205.27894-1-wens@csie.org> <20170418042205.27894-3-wens@csie.org>
 <20170418090329.odixwybrkqvp2o7z@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUVV27DQKGQESPUO2TA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170418090329.odixwybrkqvp2o7z@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 5:03 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Apr 18, 2017 at 12:22:04PM +0800, Chen-Yu Tsai wrote:
>> Kbuild now complains about leading zeroes in the address portion of
>> device node names.
>>
>> Get rid of them.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-a83t.dtsi | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> index 913aacafe8d5..82cb87f21b96 100644
>> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> @@ -162,7 +162,7 @@
>>               #size-cells = <1>;
>>               ranges;
>>
>> -             pio: pinctrl@01c20800 {
>> +             pio: pinctrl@1c20800 {
>
> As far as I know this breaks Uboot's auto-addition of stdout-path

You're right. It breaks as Uboot has the path to the uarts hard-coded.
That sucks. And from what I can tell, it's not easily solvable by just
switching to serial alias based references. CONS_INDEX won't line up
on the A23/A33 Q8 tablets.

Maybe we can just keep the uart device node the same for now, but fix
all the other ones. We can come back and fix the uart later once we
figure out how to fix Uboot.

Regards
ChenYu
