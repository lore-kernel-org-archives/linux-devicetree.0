From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Fri, 9 Sep 2016 12:56:03 -0700
Message-ID: <CALAqxLXY0-vVmkv7jokbNOC3fPKkEpnPDc-21RP8Eap_B1X34w@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com>
 <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com>
 <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ@mail.gmail.com>
 <CAL_JsqKgGFPKZR8fJ-CRQubNjWH0q_V9B9SsXoHncT9dMGdF1w@mail.gmail.com>
 <CALAqxLXLNQZMCrgLGa-=nGFbB-XVbs9FHXnGrksCO8V_mAkK0w@mail.gmail.com> <08C47A45-3704-4181-B065-B0E5975B878B@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08C47A45-3704-4181-B065-B0E5975B878B@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robh+dt@kernel.org>, Dmitry Shmidt <dimitrysh@google.com>, Frank Rowand <frowand.list@gmail.com>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 12:26 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
>> On Sep 9, 2016, at 06:06 , John Stultz <john.stultz@linaro.org> wrote:
>>
>> So in many cases the dtb is appended when the kernel is built, not
>> when the abootimg is assembled.
>>
>> So its much easier to use abootimg -u to update a prebuilt boot.img in
>> place and reflash. That way users don't need to regenerate the kernel
>> w/ appended dtb.
>>
>
> I understand what you=E2=80=99re trying to do, but it=E2=80=99s not going=
 to work.
>
> It will only work for a very small subset of overlays since you can=E2=80=
=99t
> have more than a single phandle label.
>
> For instance this will not work:
>
> overlays {
>         overlay_0 {
>                 opt: opt_0 { bar; };
>         };
>         overlay_1 {
>                 opt: opt_1 { baz; };
>         };
> };
>
>
> frob_device {
>         compatible =3D =E2=80=9Cfrob=E2=80=9D;
>         use =3D <&opt>;
> };
>
> If your use case is simple enough you=E2=80=99ll never hit this, but it d=
oes happen in
> more complex examples.

Why not then put the frob_device in the overlays?

And even so, just saying "its not going to work" isn't particularly
helpful since this *does* work for the use cases we currently have, so
lets not let perfect be the enemy of good.

I'm no dts expert (Dmitry wrote the patch), but we'd welcome ideas for
allowing a set of pre-determined dts configurations be boot-time
selectable. It doesn't have to be this solution, but we need something
and this is what we have right now.

Should we revisit multi-appended dtbs w/ a boot argument selector?
(Though this seems less ideal, as generating the various dtbs and the
duplicate waste would be a bit annoying).  Other ideas?

thanks
-john
