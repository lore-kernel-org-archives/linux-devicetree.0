From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 11/14] ARM: PMU: add device tree probing
Date: Wed, 25 Aug 2010 01:39:52 -0600
Message-ID: <AANLkTimWnPzT0KBgpMD8AoyDMsSLyx0kCcq4Jc-HP595@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<AANLkTinz2CWrzPk3BtM6tWxu1udeAS1LFzjACB9spq-y@mail.gmail.com>
	<-4778531030339335058@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <-4778531030339335058@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 20, 2010 at 4:56 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> Also, (as you've brought up before) the pdev->id issue needs to be
>> solved. =A0I don't believe it is allowed to change the id field after
>> the platform_device is registered. =A0I'd rather see the id dynamically
>> assigned, which generally works in the OF use-case because
>> interconnections between devices are described in the tree and
>> specific ids aren't really needed. =A0However, it could be that the best
>> thing to do is retrieve the system-wide unique id from the aliases
>> node.
>>
>> ... and ditto on my comment that this will be simpler if it lives
>> directly in pmu.c. =A0:-)
>
> When you say "retrieve the system-wide id from the aliases node" you mean
> at platform_device register time =A0in the OF layer (ie of_device_registe=
r),
> right ?

Not necessarily.  Where possible, I'd rather modify the drivers to not
strictly enforce a 1:1 relationship between the pdev->id, and the
driver's internal enumeration.  Hmmm, that was a little dense, so let
me try again...  In the specific case where id =3D=3D -1, I'd like to
driver to be able to handle it gracefully and allow the probe routine
to either dynamically assign, or to deduce an appropriate enumeration
value from the aliases node.

I don't have an example of the implementation to show you though.  We
should probably discuss on IRC or have a conf call.  There are a
number of subtleties and details that need to be agreed on here.

Cheers,
g.
