From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] dt: Document: correct tegra20/30 pinctrl slew-rate
 name
Date: Wed, 17 Oct 2012 09:41:29 -0600
Message-ID: <507ED1A9.1040605@wwwdotorg.org>
References: <1350473820-25662-1-git-send-email-praithatha@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1350473820-25662-1-git-send-email-praithatha@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pritesh Raithatha <praithatha@nvidia.com>, linus.walleij@linaro.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, swarren@nvidia.com, dong.aisheng@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/17/2012 05:37 AM, Pritesh Raithatha wrote:
> change nvidia,slew_rate* to nvidia,slew-rate*

The series,

Acked-by: Stephen Warren <swarren@nvidia.com>
Tested-by: Stephen Warren <swarren@nvidia.com>

Linus, I assume these will go through the pinctrl tree? If you could add
Cc: stable when you commit it, that'd be useful too. thanks.
