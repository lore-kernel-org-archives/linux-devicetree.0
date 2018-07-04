From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM: dts: sun8i: h3: Enable dwmac-sun8i on the
 Beelink X2
Date: Wed, 4 Jul 2018 10:30:40 +0200
Message-ID: <CAEKpxBn6-NoQdPXY7AEp3UB7M6s75e4gc7g8jxs7NpEH2v_c+g@mail.gmail.com>
References: <20180630062720.24225-1-codekipper@gmail.com> <20180703145020.hkct43ccbpteleht@flea>
 <CAEKpxBmCLF8PMQ2h2qghfMEMktQYdDZEPaFRLvN8-uzDr0mi9g@mail.gmail.com> <20180704074408.sx4ek6lvbaiyj5ut@flea>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBMML6LMQKGQEFR5BAYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180704074408.sx4ek6lvbaiyj5ut@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 July 2018 at 09:44, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tue, Jul 03, 2018 at 07:19:16PM +0200, Code Kipper wrote:
>> On 3 July 2018 at 16:50, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On Sat, Jun 30, 2018 at 08:27:20AM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >>
>> >> The enabling of the emac was reverted when stability issues were
>> >> discovered.
>> >
>> > What stability issues exactly? Have they been fixed? If so, by which
>> > commit?
>>
>> They were fixed by 4904337fe34f (ARM: dts: sunxi: Restore EMAC changes
>> (boards)) but this board was missed.
>
> Please add that to the commit log, and what the issue was.
(A)CK
>
> Maxime
>
> --
> Maxime Ripard, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
