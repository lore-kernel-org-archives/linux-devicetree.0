From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
Date: Wed, 20 Feb 2019 22:52:16 +0530
Message-ID: <CAMty3ZBaOZoj+xV+e+4BtYdaWA2biwENmngOa9vbbMB=_vbB1w@mail.gmail.com>
References: <20190212113808.3040-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212113808.3040-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 5:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add missing dt-binding documentation for lm75 hwmon sensor.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> -  Add all compatible nodes available in lm75.
>
>  .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt

Any comments on this? It is blocking some dts changes to get merge
into Mainline.
