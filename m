From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Mon, 3 Oct 2011 13:53:37 +0100
Message-ID: <CAMLZHHQMf7hOnDb+SNvH7qFmbA+rypJ_p7SJw64ZqtG3xq+GMg@mail.gmail.com>
References: <20110927182636.GR4289@opensource.wolfsonmicro.com>
	<CAMLZHHR0rMZct2E91X8k+Lhv_y-pY_5+vshZw6dj194o9vSCJQ@mail.gmail.com>
	<20110927183832.GS4289@opensource.wolfsonmicro.com>
	<CAMLZHHRvr-diYGwZ2Kg647Ht7NNb8LEku0pCW8EujRuUeOW5yQ@mail.gmail.com>
	<20110928123154.GG3279@opensource.wolfsonmicro.com>
	<CAMLZHHRFY_MazF_MOzPrS06z-48-ohORTtbANMxUT=mjevXhhQ@mail.gmail.com>
	<20111003102846.GA23811@sirena.org.uk>
	<CAMLZHHTMP+DJA35bUswXPbTv_U0DAWY_h_-Eg53-_4RuC3bx7A@mail.gmail.com>
	<20111003121655.GB3731@opensource.wolfsonmicro.com>
	<CAMLZHHS+fFzuWtwOwt-g2y38g93uaZFyUGsooZyYLMT=mdWQFQ@mail.gmail.com>
	<20111003124044.GF3731@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111003124044.GF3731-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2011 at 1:40 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> So, I made two suggestions above and it sounds like you want the second
> one but you've only responded to the first one without commenting on the
> second. =A0My second suggestion was that if the block is sufficiently
> isoltated from the core we should be able instantiate it from the device
> tree without requiring explicit code in the core driver.

Sorry, hadn't quite grasped what you meant there. I understand now.

It is an interesting idea but leaves me with some questions/problems:

The GPIO controller needs to find its register space by looking at the
PCI device (the ISA bridge). So probing it independently could maybe
be viewed by some as a hierarchy violation as it would have to then
hunt around for its PCI dev.

According to Grant's hard rule, the parent device needs to be the
thing that passes the of_node to the child.
So we would still need a driver for the parent ISA bridge
instantiating the child GPIO controller. Wouldn't that bring us
straight back to the same problem (that the "core" needs code to
instantiate the child)?

Also, not an argument against the direction, but an outstanding
problem that would need to be resolved: the x86 device tree
implementation doesn't seem to follow Grant's design for how things
should work (or maybe I misunderstood something), so work would be
needed there first. See the unfinished discussion at
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-July/006853.html

Thanks,
Daniel
