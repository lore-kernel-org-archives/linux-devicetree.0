From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 22 Feb 2010 09:13:40 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com><1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com><1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com><20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss><fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <fa686aa41002212226i4c83376cn8d88a045dd13fe00-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Wood Scott-B07421 <B07421@frees>
List-Id: devicetree@vger.kernel.org


> > That still leaves node and property deletion to cover. =A0In keeping
> > with the above approach, I'd like to do that in the form of =

> "negative
> > redefinitions" of properties or nodes. =A0A neat syntax for =

> that doesn't
> > immediately occur to be for that yet, though.
> =

> hmmm.  I'll think more about it too.  I agree that a negative
> redefinition sounds like a reasonable approach.  I do want the ability
> to drop nodes easily.  It would make it easy to handle SoC or FPGA
> design variants.

We had a similar problem in the Freescale Embedded Hypervisor
to control the generation of guest device trees.   We defined
several 'magic' properties that had special meaning in =

the context of a node update.

   delete-prop   <stringlist>   The value identifies one or more names of
                                properties that should be deleted from the
                                node.

   delete-node   <stringlist>   The value identifies one or more names of
                                nodes that should be deleted. The node and
                                all descendants will be deleted.

We also had the need to prepend to a <stringlist> so that =

compatible properties could be updated.

   prepend-stringlist  <stringlist> The value is a string list that
                                    specifies on or more property name/value
                                    pairs. =


                                    "prop-name1," "prop-value1,"
                                         "prop-name2," "propvalue2,"

                                    Each name/value pair consists of two
                                    strings-the first is the name of the
                                    property, the second is a string
                                    to prepend to the property. If the
                                    property does not already exist it will
                                    be created.

Examples

   / {
        parent {
                child1 {
                        new-property =3D "stuff";
                        delete-prop =3D "foo", "bar";
                };
        };
   };

   / {
        parent {
                child1 {
                        delete-node =3D "childA", "childB";
                };
        };
   };

   / {
        parent {
                child1 {
                        prepend-stringlist =3D "compatible", "fsl,foo-bar";
                };
        };
   };

Regards,
Stuart
