From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: Documentation for qcom, llcc
Date: Wed, 16 May 2018 10:03:33 -0700
Message-ID: <152649021310.210890.14841324536807182632@swboyd.mtv.corp.google.com>
References: <1525810921-15878-1-git-send-email-rishabhb@codeaurora.org>
 <1525810921-15878-2-git-send-email-rishabhb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525810921-15878-2-git-send-email-rishabhb@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm@lists.infradead.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, evgreen@chromium.org, robh@kernel.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rishabh Bhatnagar (2018-05-08 13:22:00)
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt b/Do=
cumentation/devicetree/bindings/arm/msm/qcom,llcc.txt
> new file mode 100644
> index 0000000..a586a17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
> @@ -0,0 +1,32 @@
> +=3D=3D Introduction=3D=3D
> +
> +LLCC (Last Level Cache Controller) provides last level of cache memory i=
n SOC,
> +that can be shared by multiple clients. Clients here are different cores=
 in the
> +SOC, the idea is to minimize the local caches at the clients and migrate=
 to
> +common pool of memory. Cache memory is divided into partitions called sl=
ices
> +which are assigned to clients. Clients can query the slice details, acti=
vate
> +and deactivate them.
> +
> +Properties:
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be "qcom,sdm845-llcc"
> +
> +- reg:
> +       Usage: required
> +       Value Type: <prop-encoded-array>
> +       Definition: Start address and the range of the LLCC registers.

Start address and size?

> +
> +- max-slices:
> +       usage: required
> +       Value Type: <u32>
> +       Definition: Number of cache slices supported by hardware
> +
> +Example:
> +
> +       llcc: qcom,llcc@1100000 {

cache-controller@1100000 ?

> +               compatible =3D "qcom,sdm845-llcc";
> +               reg =3D <0x1100000 0x250000>;
> +               max-slices =3D <32>;
> +       };
> --=20
