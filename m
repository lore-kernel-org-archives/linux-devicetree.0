From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from examples
Date: Mon, 4 Sep 2017 09:46:36 +0100
Message-ID: <20170904084635.GA26317@leverpostej>
References: <20170901211447.26865-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170901211447.26865-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 01, 2017 at 04:14:47PM -0500, Rob Herring wrote:
> Pretty much any node can have a status property, so it doesn't need to
> be in examples.
> 
> Converted with the following command and removed examples with SoC and
> board specific splits:
> 
> git grep -l -E 'status.*=.*' Documentation/devicetree/ | xargs sed -i -E '/\sstatus.*=.*"(disabled|ok|okay)/d'
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
