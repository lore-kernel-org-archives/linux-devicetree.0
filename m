From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Mon, 11 May 2015 16:11:44 +0800
Message-ID: <CAGb2v65ZasVzo+JjkQ9ToAobg-WYPQ49O9Kjwbo4RkJCCCKV0g@mail.gmail.com>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-6-git-send-email-jenskuske@gmail.com> <20150506121941.GD11057@lukather>
 <554A7DE5.6040406@gmail.com> <20150509114428.GV11057@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWGIYGVAKGQEBD2W27I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150509114428.GV11057@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 9, 2015 at 7:44 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, May 06, 2015 at 10:47:33PM +0200, Jens Kuske wrote:
>> >> + *     You should have received a copy of the GNU General Public
>> >> + *     License along with this file; if not, write to the Free
>> >> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
>> >> + *     MA 02110-1301 USA
>> >
>> > Could you remove that last paragraph?
>> > It generates a checkpatch warning.
>>
>> Sure, will be removed. Just copied it from some other sunxi dtsi.
>
> Yeah, I know, I'm even the one that introduced this in the first place
> :)
>
> I sent a patch earlier this week to remove it from the other DT.
>
>> >> +          ahb12_rst: reset@01c202c0 {
>> >> +                  #reset-cells = <1>;
>> >> +                  compatible = "allwinner,sun6i-a31-clock-reset";
>> >> +                  reg = <0x01c202c0 0xc>;
>> >> +          };
>> >
>> > This reset controller also resets the timers, it should be initialised
>> > much earlier.
>> >
>> > What about having an allwinner,sun8i-h3-bus-reset, and adding it to
>> > the list of compatibles to initialise earlier in
>> > drivers/reset/reset-sunxi.c?
>> >
>> > Of course, it would cover the other reset controllers that you have
>> > below.
>> >
>>
>> You mean using a single bus_rst instead of the three?
>
> Yes.
>
>> Or, why not using allwinner,sun6i-a31-ahb1-reset for ahb12_rst
>
> Strictly speaking, they do not control the same set of devices. I'd
> prefer to have a different compatible in case we need to setup a
> particular behaviour on a given SoC (for example, force out of reset a
> particular device, even if no driver is actually using it), without
> impacting the other.
>
>> and adding a .init_time = sun6i_timer_init to the sun8i machine.
>
> But we will need to do that yes.
>
>> I'm a bit confused here now, because for A23, which is almost
>> identical, it got removed after your comment:
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/265064.html
>
> Hmmmm, I think I somehow overlooked the fact that the timer was there,
> even though Chen-Yu said it. My bad :/

On the A23, the high speed timer block only has 1 timer. The sun5i-hrtimer
driver requires 2, and turns out we weren't using them anyway, so I just
dropped sun5i-hrtimer support on A23.

If the other sun8i SoCs have 2 or more timers, feel free to support them.

ChenYu
