From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 11:52:50 -0600
Message-ID: <fa686aa40905271052k3f55eb73k2cb0c3cff3c94d7b@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<20090527174440.GA31861@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527174440.GA31861-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 11:44 AM, Russell King
<rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> (For whatever reason, I don't have the initial email on this.)
>
> On Wed, May 27, 2009 at 08:27:10AM -0600, Grant Likely wrote:
>> On Wed, May 27, 2009 at 1:08 AM, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org> wro=
te:
>> > Hi, All
>> >
>> > Currently, ARM linux uses mach-type to figure out platform. But mach-t=
ype could not handle variants well and it doesn't tell the kernel about inf=
o about attached peripherals.
>> >
>> > The device-tree used by powerpc and sparc could simplifiy board ports,=
 less platform specific code and simplify device driver code.
>> >
>> > Please reference to Grant Likely and Josh Boyer's paper, A Symphony of=
 Flavours: Using the device tree to describe embedded hardware , for the de=
tail of device tree.
>> >
>> > www.kernel.org/doc/ols/2008/ols2008v2-pages-27-38.pdf
>> >
>> > Signed-off-by: janboe <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>
>>
>> Heeheehe, This is Fantastic. =A0I'm actually working on this too. =A0Wou=
ld
>> you like to join our efforts?
>
> My position is that I don't like this approach. =A0We have _enough_ of a
> problem getting boot loaders to do stuff they should be doing on ARM
> platforms, that handing them the ability to define a whole device tree
> is just insanely stupid.

The point of this approach is that the device tree is *not* create by
firmware.  Firmware can pass it in if it is convenient to do so, (ie;
the device tree blob stored in flash as a separate image) but it
doesn't have to be and it is not 'owned' by firmware.

It is also true that there is the option for firmware to manipulate
the .dts, but once again it is not required and it does not replace
the existing ATAGs.

If a board port does get the device tree wrong; no big deal, we just
fix it and ship it with the next kernel.

> The end story is that as far as machine developers are concerned, a
> boot loader, once programmed into the device, is immutable. =A0They never
> _ever_ want to change it, period.

I agree 100%.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
