From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: iio: maxbotix,mb1232.yaml: transform to yaml
Date: Mon, 7 Oct 2019 13:04:23 -0500
Message-ID: <CAL_JsqK-yZnPcb=YPfygK4Y+mJ=JoYq7qWbx04_roAiUD=54Sg@mail.gmail.com>
References: <20191006142715.45k64cgw7mzlekm5@arbad> <CAL_Jsq+0SpRVmGJSm5Hw8bQ_zdeJy5wfTb9RM1r=crkiT2uM-Q@mail.gmail.com>
 <20191007170018.673p6fs6mjokihn6@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007170018.673p6fs6mjokihn6@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 12:00 PM Andreas Klinger <ak@it-klinger.de> wrote:
>
> Hi Rob,
>
> i don't get this error. Is there anything i'm doing wrong here?
>
> ak@arbad:/project/opt-sw/linux-robh$ make O=3D../build-wega-robh/ dt_bind=
ing_check
> make[1]: Verzeichnis =E2=80=9E/project/opt-sw/build-wega-robh=E2=80=9C wi=
rd betreten
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
>   /project/opt-sw/linux-robh/Documentation/devicetree/bindings/net/adi,ad=
in.yaml:
>   ignoring, error in schema 'adi,fifo-depth-bits'
>   warning: no schema found in file:
>   /project/opt-sw/linux-robh/Documentation/devicetree/bindings/net/adi,ad=
in.yaml
>   /project/opt-sw/linux-robh/Documentation/devicetree/bindings/regulator/=
fixed-regulator.yaml:
>   ignoring, error in schema '0'
>   warning: no schema found in file:
>   /project/opt-sw/linux-robh/Documentation/devicetree/bindings/regulator/=
fixed-regulator.yaml
>     CHKDT   Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12=
32.yaml
>     CHKDT   [...]

It would be in the later stage when dtc builds the exmaple. The
unrelated errors here may be making things error out before that.

BTW, update dtschema and it will fix the first error. The 2nd one is
pending in linux-next still.

Rob
