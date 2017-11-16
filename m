From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] DT: i2c: W83773G is a trivial device
Date: Wed, 15 Nov 2017 22:33:29 -0600
Message-ID: <20171116043329.isdd23nf4khk7wai@rob-hp-laptop>
References: <1510543655-27059-1-git-send-email-mine260309@gmail.com>
 <1510543655-27059-2-git-send-email-mine260309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510543655-27059-2-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Lei YU <mine260309@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 11:27:32AM +0800, Lei YU wrote:
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> index af284fb..63ad2f1 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> @@ -188,3 +188,4 @@ ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Inter
>  ti,tmp275		Digital Temperature Sensor
>  winbond,w83793		Winbond/Nuvoton H/W Monitor
>  winbond,wpct301		i2c trusted platform module (TPM)
> +nuvoton,w83773g		Nuvoton Temperature Sensor

Keep alphabetical order please.

Send trivial-devices.txt changes separately to me and I'll take them to 
avoid any conflicts.

Rob
