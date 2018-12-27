From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: add binding for USBSS-DRD controller.
Date: Thu, 27 Dec 2018 15:01:39 -0600
Message-ID: <CAL_JsqLQ83f74kMRsRX=Bo+xwP05v+2dLQaPLVV3EU7k=QwvSQ@mail.gmail.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-2-git-send-email-pawell@cadence.com> <20181220200111.GA27998@bogus>
 <BYAPR07MB4709910A6EE4B54BA455E713DDB90@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709910A6EE4B54BA455E713DDB90@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@kernel.org" <balbi@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 22, 2018 at 4:24 PM Pawel Laszczak <pawell@cadence.com> wrote:
>
> Hi Rob,
>
> >On Mon, Dec 10, 2018 at 12:39:14PM +0000, Pawel Laszczak wrote:
> >> This patch aim at documenting USB related dt-bindings for the
> >> Cadence USBSS-DRD controller.
> >>
> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

[...]

> >> + - phys: reference to the USB PHY
> >> + - phy-names: name of the USB PHY, should be "cdns3,usbphy"
> >
> >Don't need -names when there is only one.
>
> But in the future probably we will need to add next phy version.
> So maybe it's better to leave this name ?

'-names' are for when there is more than one phy connected, not
different phy versions. For example, if you had separate phys for HS
and SS.

Rob
