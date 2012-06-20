From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 3/3] regulator: dt: add policy to have property "regulator-compatible"
Date: Wed, 20 Jun 2012 12:52:28 -0600
Message-ID: <4FE21BEC.6090308@wwwdotorg.org>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340194987-23654-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, arnd@arndb.de, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 06:23 AM, Laxman Dewangan wrote:
> Add the policy for regulator DT such that if device have multiple
> regulator and its binding contains a child node that describes each
> regulator then each regulator child node must have the property
> "regulator-compatible" which matches with regulator name of their
> hardware counterparts.
> Modify the DT documentation of regulator devices to reflect this
> policy.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

I'm personally OK with this change as-is, so
Acked-by: Stephen Warren <swarren@wwwdotorg.org>

I suspect Mark may want the wording in regulators.txt modified a little
to allow each regulator binding to choose whether they want the
regulator child nodes identified using the new regulator-compatible
property, or whether they want each instantiated as an actual device,
using regular device instantiation techniques. That could always be a
later patch though, and I'll leave this aspect up to Mark.
