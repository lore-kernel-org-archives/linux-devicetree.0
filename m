From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Wed, 31 Jan 2018 10:54:29 +0100
Message-ID: <CAEKpxBmVzeUN=1F=APVomu4s4h2s83R4JX3EG1=1Mu_ZBSF96g@mail.gmail.com>
References: <20180129092223.12423-1-codekipper@gmail.com> <20180129102227.ejmbifzjqmba3yja@flea.lan>
 <27087126.4975652.1517222127863.JavaMail.zimbra@musers.siol.net> <20180131071616.jrkd465cq4mgyyvm@flea.lan>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBV5EY3JQKGQEBRJ226Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180131071616.jrkd465cq4mgyyvm-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 January 2018 at 08:16, maxime ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Jan 29, 2018 at 11:35:27AM +0100, Jernej =C5=A0krabec wrote:
>> Hi Maxime,
>>
>> (previously I respond only to linux-sunxi mailing list)
>>
>> >On Mon, Jan 29, 2018 at 10:22:23AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >>
>> >> Add the new DAI block for I2S2 which is used for HDMI audio.
>> >>
>> >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >
>> >queued for 4.17, thanks!
>> >Maxime
>>
>> Please note that HDMI I2S has usable 4 I2S lanes, since HDMI
>> supports 8 channel audio. As Marcus said, other blocks probably
>> support them too, they are just not wired out on pins.
>
> I've dropped those patches for now.
>
>> Should we change compatible for HDMI?
>
> I guess, another way of doing things if they are strictly identical
> but for the number of lanes they support would be to add a DT property
> for that number of lanes.
>
That's fine...I'll look into adding a dt property and how we would map
channels to lanes.
Do you know of any examples?,
BR,
CK
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
