From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH V7 REPOST] kbuild: create a rule to run the pre-processor
 on *.dts files
Date: Tue, 29 Jan 2013 09:50:59 +0100
Message-ID: <51078D73.9010409@suse.cz>
References: <1359419600-7967-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359419600-7967-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <glikely@secretlab.ca>, Sam Ravnborg <sam@ravnborg.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 29.1.2013 01:33, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Create cmd_dtc_cpp to run the C pre-processor on *.dts file before
> passing them to dtc for final compilation. This allows the use of #define
> and #include within the .dts file.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Simon Glass <sjg@chromium.org>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
> Grant, back in mid-November, you said you'd make a decision on this in
> the next couple of days, but I think this got overlooked.

You can add Acked-by: Michal Marek <mmarek@suse.cz>. Or I can add it to
the kbuild tree if Grant is OK with the patch.

Michal
