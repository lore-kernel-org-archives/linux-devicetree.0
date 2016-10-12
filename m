From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 0/4] libfdt: Add support for device tree overlays
Date: Wed, 12 Oct 2016 17:06:07 +0200
Message-ID: <965C6014-692F-4021-9E3D-945ED32307B7@konsulko.com>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com> <20161006094756.GR18733@umbus.fritz.box> <6338fcb9-ffda-a04b-6c6e-2fd254b58dda@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6338fcb9-ffda-a04b-6c6e-2fd254b58dda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?windows-1252?Q?Antoine_T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> On Oct 6, 2016, at 23:16 , Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>=20
> On 06/10/2016 10:47, David Gibson wrote:
>> On Fri, Sep 30, 2016 at 03:57:13PM +0200, Maxime Ripard wrote:
>>> Hi,
>>>=20
>>> The device tree overlays are a great solution to the issue raised by
>>> the bunch expandable boards we find everywhere these days, like the
>>> Beaglebone, Raspberry Pi or CHIP.
>>>=20
>>> Although for now Linux is the only available tool that can deal with
>>> overlays, some other components like bootloaders or user-space tools
>>> might need to apply these overlays on top of a base device tree.
>>>=20
>>> To address these use cases, we introduce a new function to the =
libfdt,
>>> fdt_overlay_apply, that does just that.
>>>=20
>>> You can find a test program here: =
http://code.bulix.org/792zum-99476?raw
>>>=20
>>> This is the last patches sent to U-boot, with the modifications
>>> suggested by David, and the additional test cases.
>>>=20
>>> Let me know what you think!
>>> Maxime
>> Looking pretty good.  There's a minor error in 3/4 which I've pointed
>> out, it can be fixed in a followup.
>>=20
>> An error in the conditionals means it's trying to run some of the
>> tests which require an overlay-aware dtc on even when that's not
>> available - I adjusted 4/4 to correct that.
>>=20
>> It also hit build failures on Travis, because the compiler version
>> there complains about local variables named 'index' shadowing the
>> standard library function.  I've corrected that with a followup =
patch.
>>=20
>> With that done, the whole lot has been committed to master.
>>=20
> Now that upstream libfdt can resolve and apply overlays we need a way
> of generating them. I have a set of three patches from Pantelis that
> add "plugin" support to dtc, together with two downstream (Raspberry =
Pi)
> patches that fix an uninitialised memory reference and restrict
> __local_fixups__  generation to overlays.
>=20
> Is there already a plan to get the enhanced dtc upstreamed? If so, can =
I
> get the downstream fixes included?
>=20

David, my patchset is kept updated against mainline dtc.
What are the remaining stumbling blocks in getting in accepted?

> Phil Elwell

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
