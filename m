From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] Documentation: dt: Add binding for
 /secure-chosen/stdout-path
Date: Fri, 12 Oct 2018 15:45:13 -0500
Message-ID: <20181012204513.GA29769@bogus>
References: <20181008101642.8040-1-jerome.forissier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008101642.8040-1-jerome.forissier@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, Etienne Carriere <etienne.carriere@linaro.org>, tee-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 06:16:42PM +0800, Jerome Forissier wrote:
> Some platforms may use a single device tree to describe two address
> spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
> for Secure-only devices"). For these platforms it makes sense to define
> a secure counterpart of /chosen, namely: /secure-chosen. This new node
> is meant to be used by the secure firmware to pass data to the secure
> OS. Only the stdout-path property is supported for now.
> 
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> ---
> 
> Notes:
>     Sending this again, slightly modified. Previous submission was in March
>     2017 [1]. Since then, OP-TEE has implemented this binding for platforms
>     that use DT [2] (fallback to /chosen/stdout-path to be implemented in
>     [3]). A patch for QEMU has been proposed [4], to which the maintainer
>     responded "Are the DT bindings upstream yet?" ;-)
>     
>     [1] https://patchwork.kernel.org/patch/9602401/
>     [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
>     [3] https://github.com/OP-TEE/optee_os/pull/2569
>     [4] https://patchwork.ozlabs.org/patch/979345/
>     
>     Changes since v1:
>     - Use "should" instead of "may" ("...the Secure OS should use the value
>     of /chosen/stdout-path...").
> 
>  Documentation/devicetree/bindings/arm/secure.txt | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Applied.

Rob
