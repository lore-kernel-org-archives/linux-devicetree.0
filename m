From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Pinmux with device tree
Date: Thu, 19 May 2011 11:42:26 -0600
Message-ID: <BANLkTin-2y45WYaZpCEAFiSidCT0HvPjXw@mail.gmail.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
	<4DD41F02.4050108@firmworks.com>
	<BANLkTim94SKgWvUF6_PWb9O5YsuNk120Bw@mail.gmail.com>
	<20110519171029.GH3085@ponder.secretlab.ca>
	<74CDBE0F657A3D45AFBB94109FB122FF0498A47BFF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498A47BFF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2011 at 11:24 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Grant Likely wrote at Thursday, May 19, 2011 11:10 AM
>> On Thu, May 19, 2011 at 07:30:52PM +0800, Haojian Zhuang wrote:
>> > On Thu, May 19, 2011 at 3:33 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wro=
te:
>> > > On 5/18/2011 6:34 AM, Simon Glass wrote:
>> > >>
>> > >> Hi,
>> > >>
>> > >> I see a new pinmux system in the LKML. Has anyone looked at how to
>> > >> represent pinmux settings in the device tree?
>> > >>
>> > >> On a related topic, the examples that are used for GPIOs assume a
>> > >> flags word which describes things like pull-ups, direction, etc. Th=
is
>> > >> seems pretty cumbersome and gets worse with pinmuxes. People editing
>> > >> the device trees want to see symbolic information rather than a cod=
ed
>> > >> number, a bit like a #define. I can see this can be done with strin=
gs
>> > >> but this is inefficient in time and space, and is error-prone. =A0Is
>> > >> there support for this in device trees that I have missed?
>>
>> Why is it error prone? =A0It is probably less error prone than using
>> magic integer values. =A0:-)
>
> I think that comment was saying that if the FDT itself contains the strin=
gs,
> if there were a typo, it'd only be detected at run-time (well, admittedly
> just like a typo in a number).

We can (and do) implement semantic checks in dtc.

>
> However, if the DT compiler implemented something like the pre-processor,
> any typos in define usage would be detected at compile time due to refere=
ncing
> a non-existing define/variable, which is less error-prone.
>
> I must admit, when I first saw DT source files, my first though was to run
> CPP on them (or similar token->integer replacement utility, which also
> supported bitwise math e.g. for the GPIO flags stuff), and then pass the
> result to dtc, so that I could work with names instead of numbers.

There has been much talk over the years about how to make dtc better.
I did try at one point to use CPP, but unfortunately there were too
many C assumption in CPP that made the result... yucky.

g.
