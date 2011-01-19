From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/2] powerpc: document the MPIC device tree binding
Date: Wed, 19 Jan 2011 22:14:42 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E150306BF11@039-SN1MPN1-004.039d.mgd.msft.net>
References: <4D34E448.8000902@mentor.com>
	<AANLkTi=QX4BfLvPfQDMOgmh90TtX4MQqio6AOZR8JKas@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=QX4BfLvPfQDMOgmh90TtX4MQqio6AOZR8JKas-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> +** Optional properties:
> +
> + =A0 - no-reset : The presence of this property indicates that the MPIC
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0should not be reset during runtime initi=
alization.
> + =A0 - protected-sources : Specifies a list of interrupt sources that are
> + not
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 available for use and w=
hose corresponding
> + vectors
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 should not be initializ=
ed. =A0A typical use case
> + for
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this property is in AMP=
 systems where multiple
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 independent operating s=
ystems need to share
> + the MPIC
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 without clobbering each=
 other.

Is "protected-sources" really needed for AMP systems to
tell the OSes not to clobber each other?  Won't each
OS be given a device tree with only its interrupt
sources?  ...so you know what you are allowed to touch.

Stuart
