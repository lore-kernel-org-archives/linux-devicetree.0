From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Support qcom pinctrl protected pins
Date: Tue, 20 Feb 2018 10:45:03 -0600
Message-ID: <94a7bd07-8ad5-7ab1-20ab-a02fe2476efd@codeaurora.org>
References: <20180126011400.2191-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180126011400.2191-1-sboyd@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/25/2018 07:13 PM, Stephen Boyd wrote:
> This patchset proposes a solution to describing the valid
> pins for a pin controller in a semi-generic way so that qcom
> platforms can expose the pins that are really available.
> 
> Typically, this has been done by having drivers and firmware
> descriptions only use pins they know they have access to, and that
> still works now because we no longer read the pin direction at
> boot. But there are still some userspace drivers and debugfs facilities
> that don't know what pins are available and attempt to read everything
> they can. On qcom platforms, this may lead to a system hang, which isn't
> very nice behavior, even if root is the only user that can trigger it.

Any progress on this patch set?  Stephen no longer works for Qualcomm, 
so I don't know what the next step is, and I really want this feature in 
4.17 (we've missed so many merge windows already).

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
