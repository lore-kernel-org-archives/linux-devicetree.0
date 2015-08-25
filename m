From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: Re-using sun5i-a13.dtsi for the r8 ?
Date: Tue, 25 Aug 2015 15:27:09 +1000
Message-ID: <CAGRGNgUpDZnPxnSP5wmcAFL=gHmGS5vURGxjAV-ywWn4u61E6w@mail.gmail.com>
References: <55D6D8E3.3020403@redhat.com> <20150824142630.GU2413@lukather>
 <CAGRGNgW06-znXSnPKS3nfU_FseTZ0OcMea5qEzHVaTkpRfXHUg@mail.gmail.com> <20150825051450.GY2413@lukather>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBQPZ56XAKGQEQMNEAXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150825051450.GY2413@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Tue, Aug 25, 2015 at 3:14 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Aug 25, 2015 at 10:24:51AM +1000, Julian Calaby wrote:
>> Hi Maxime,
>>
>> On Tue, Aug 25, 2015 at 12:26 AM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On Fri, Aug 21, 2015 at 09:53:07AM +0200, Hans de Goede wrote:
>> >> I just realized that I never answered your question about the need
>> >> for a tvencoder simplefb node in sun5i-a13.dtsi, like the one from
>> >> the "ARM: dts: sun5i: Add simplefb node for tvencoder output"
>> >>
>> >> I think the real question is do we want to use sun5i-a13.dtsi for
>> >> the r8 ?
>> >
>> > So far, the only information I got about the R8 was that it was
>> > strictly identical to the A13, and it was making sense to re-use it
>> > entirely.
>>
>> Does having the tvout pin change the pinmux options or is that pin
>> strictly single use?
>>
>> (And if it is strictly single use, is adding that pin the entirety of
>> the software visible hardware changes?)
>
> I have no idea.
>
>> >> I would expect us to use a sun5i-r8.dtsi, this one could then
>> >> include sun5i-a13.dtsi, and have the extra simplefb node for
>> >> the tvencoder. Putting the simplefb node for the tvencoder
>> >> in sun5i-a13.dtsi feels wrong because the A13 package does
>> >> not have a tvout pin.
>> >
>> > But if it turns out it's not, then yeah, we'll have to make another
>> > DTSI.
>>
>> IMHO that's enough of a change to warrant a new DTSI,
>
> Yep.
>
>> I feel that someone's going to use the lack of DTSI as "proof" that
>> we don't support the R8 or try to use the tv encoder on an A13.
>
> But that argument is dubious. That's not how it works. The list of
> DTSIs has never been comprehensive list of the supported SoCs.

Most definitely. I'm not talking about sensible people here. =)

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
