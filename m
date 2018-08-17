From: Rob Herring <robh+dt@kernel.org>
Subject: Re: How delete node or property in overlayd dts?
Date: Fri, 17 Aug 2018 11:47:48 -0600
Message-ID: <CAL_JsqLV5d5cL3o3Dx=--zGD37c5O09rL9AXyRFmceTfBHt3Zg@mail.gmail.com>
References: <CADUUTHBZ---U7YNYYry7qJY=vt_QpXpytymqJQc9xLFE_NjsAg@mail.gmail.com>
 <c342562e-f915-a853-c2a8-eecefd94b88d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c342562e-f915-a853-c2a8-eecefd94b88d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zbsdta@gmail.com, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 7:26 PM Frank Rowand <frowand.list@gmail.com> wrote=
:
>
> On 08/14/18 07:46, =E5=BC=A0=E6=B3=A2 wrote:
> > /delete-node/ /delete-prop/ could be used in dtsi files without device
> > tree overlay.
> >
> > but with device tree overlay,  /delete-node/ and  /delete-prop/ are not=
 work.
> > How to delete property and node in overlay dts?
> >
> > for example,
> > in basel.dts have following node
> > node1 {
> >     property1;
> >     property3;
> >     node2 {
> >         property2;
> >     }
> > }
> >
> > in overlay.dts as following
> >  node1 {
> >     /delete-property/ property1;
> >     /delete-node/ node2;
> > }
> >
> > after overlay, property1 and node2 is not deleted.
> >
>
> The /delete-node/ and /delete-prop/ directives are only used by the
> dtc compiler within a single compilation.
>
> There is nothing in the format of a devicetree blob to represent the
> notion of deleting a property or a node.
>
> You can not delete a property or a node in an overlay dtb.

Though you can add/override 'status' with 'status =3D "disabled";' which
should be treated very similar to a node not being present. I say
similar because it's a source of bugs for the OS to fail to pay
attention to status property.

Rob
