From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Require guidance on ARM device tree
Date: Wed, 19 Jan 2011 14:29:58 -0700
Message-ID: <AANLkTikZgF9n0g=a1NGsq_v976V5gmn4SmZJonXh+hJ+@mail.gmail.com>
References: <AANLkTikUdJTWg2qGw_AASZNW+yivAXCf4qzSd-yF6N=p@mail.gmail.com>
	<AANLkTi=5+jdEYhzXM7Jfkej7cgqD_v4Cju9-XvNLQ-f4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=5+jdEYhzXM7Jfkej7cgqD_v4Cju9-XvNLQ-f4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

Yesterday I posted a new series of dt-on-arm patches[1] and announced
a new branch to use for dt development[2].  You should take a look at
that tree for your dt work.

[1] https://lkml.org/lkml/2011/1/18/239
[2] git://git.secretlab.ca/git/linux-2.6 devicetree/arm

Also, as of Monday, I've starting doing some work for Linaro with the
goal of getting dt support complete and implemented for several ARM
platforms.  As part of that, I'm collecting a list of people who are
working on dt infrastructure and I'll be organizing a weekly meeting
to work through any problems they're having with getting dt support up
and running.

We'll be talking more about this at the KernelWG conf call next week,
and I'll be sure to keep you in the loop.

Cheers,
g.

On Fri, Jan 14, 2011 at 3:08 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Fri, Jan 14, 2011 at 1:28 PM, Thomas Abraham
> <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Hi,
>>
>> I am currently working on device tree support for Samsung's S5PV310
>> Cortex-A9 platform. This work is based on
>> git://git.secretlab.ca/git/linux-2.6.git test-devicetree.
>>
>> It would be very helpful to know if this is the correct place to start o=
r if
>> there is a better location. Any other suggestions on how to go about add=
ing
>> device tree support for a ARM platform would be very helpful.
>
> Hi Thomas. =A0It's as good a place as any to start, but that branch does
> get rebased from time to time. =A0I'm in the process of creating a new
> branch for arm-devicetree which will be stable and won't get rebased.
> I'll be announcing it on the devicetree-discuss list once I've got it
> pushed out.
>
> g.
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
