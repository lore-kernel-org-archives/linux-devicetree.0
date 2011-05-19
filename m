From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pinmux with device tree
Date: Thu, 19 May 2011 10:24:31 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0498A47BFF@HQMAIL01.nvidia.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
	<4DD41F02.4050108@firmworks.com>
	<BANLkTim94SKgWvUF6_PWb9O5YsuNk120Bw@mail.gmail.com>
	<20110519171029.GH3085@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110519171029.GH3085-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote at Thursday, May 19, 2011 11:10 AM
> On Thu, May 19, 2011 at 07:30:52PM +0800, Haojian Zhuang wrote:
> > On Thu, May 19, 2011 at 3:33 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrot=
e:
> > > On 5/18/2011 6:34 AM, Simon Glass wrote:
> > >>
> > >> Hi,
> > >>
> > >> I see a new pinmux system in the LKML. Has anyone looked at how to
> > >> represent pinmux settings in the device tree?
> > >>
> > >> On a related topic, the examples that are used for GPIOs assume a
> > >> flags word which describes things like pull-ups, direction, etc. This
> > >> seems pretty cumbersome and gets worse with pinmuxes. People editing
> > >> the device trees want to see symbolic information rather than a coded
> > >> number, a bit like a #define. I can see this can be done with strings
> > >> but this is inefficient in time and space, and is error-prone. =A0Is
> > >> there support for this in device trees that I have missed?
> =

> Why is it error prone?  It is probably less error prone than using
> magic integer values.  :-)

I think that comment was saying that if the FDT itself contains the strings,
if there were a typo, it'd only be detected at run-time (well, admittedly
just like a typo in a number).

However, if the DT compiler implemented something like the pre-processor,
any typos in define usage would be detected at compile time due to referenc=
ing
a non-existing define/variable, which is less error-prone.

I must admit, when I first saw DT source files, my first though was to run
CPP on them (or similar token->integer replacement utility, which also
supported bitwise math e.g. for the GPIO flags stuff), and then pass the
result to dtc, so that I could work with names instead of numbers.

--
nvpublic
