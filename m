From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/6] mailbox: Add generic mechanism for testing
 Mailbox Controllers
Date: Thu, 13 Aug 2015 15:26:14 +0100
Message-ID: <20150813142614.GH8782@x1>
References: <20150813091914.GB8782@x1>
 <CABb+yY0cgbtM68-E_Xqgh5O6GRLXESYTLa5WcAwUBoVL3ufrxA@mail.gmail.com>
 <20150813102335.GC8782@x1>
 <CABb+yY3z7p97eOhncQ2i+g6yoYGfDgSN9BDPKmiDaVLa3oPocA@mail.gmail.com>
 <20150813110008.GD8782@x1>
 <CABb+yY34i=VUnswUE21vgeQYAGOS=7uwvdnTAFFgYkTV0CFk=w@mail.gmail.com>
 <20150813114005.GF8782@x1>
 <CABb+yY2OH16mgOwi=yH_eEHQN2Ck2x5xtVk-p-8Un9gGmcACdw@mail.gmail.com>
 <20150813130736.GG8782@x1>
 <CABb+yY2N6=oTrwni0tw1WffLv-udtBWh9LJR43EMVqYf+i2xUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2N6=oTrwni0tw1WffLv-udtBWh9LJR43EMVqYf+i2xUg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@stlinux.com, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Aug 2015, Jassi Brar wrote:

> On Thu, Aug 13, 2015 at 6:37 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> >
> > Now just agree with me that mbox_request_chan() should fail on requ=
est
> > of a known bad configuration request and I can code all this up and
> > re-submit. :D
> >
> You make me look like a jerk :(   My problem is not with validation a=
s
> such. I see problem in the way you implement that makes validation
> necessary. I'll explain step-by-step in the driver post.

That wasn't the intention, don't be so sensitive. ;)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
