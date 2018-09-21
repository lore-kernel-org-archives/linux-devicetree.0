From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add ina3221 documentation
Date: Fri, 21 Sep 2018 14:51:01 -0700
Message-ID: <CAGoOwPTEEdzND3gCUP81weTUh3wkUeaLTqgmFANHknnyEaEijQ@mail.gmail.com>
References: <20180921201252.12875-1-nicoleotsuka@gmail.com> <20180921201252.12875-2-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921201252.12875-2-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>, robh+dt@kernel.org, mark.rutland@arm.com, Jonathan Corbet <corbet@lwn.net>
Cc: afd@ti.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Found two mistakes at this doc, sending v3.

On Fri, Sep 21, 2018 at 1:12 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,38 @@
> +ina3221 properties
> +

Should be a description of the doc.

> +  VDD_GPU {
> +          shunt-resistor = <5>;

Should be <5000>.
