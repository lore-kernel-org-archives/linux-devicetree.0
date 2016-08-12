From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Date: Fri, 12 Aug 2016 13:34:49 -0500
Message-ID: <20160812183448.GA32059@rob-hp-laptop>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
> This documents the generic properties "rprocs" and "rproc-names", used
> for consumer drivers to reference a remoteproc node.

How do you intend to use this? I wonder if it would not be better to 
expose a remote proc with existing bindings for a particular purpose 
(e.g. clocks, resets, etc.) rather than a generic connection. The client 
side would have to have specific knowledge as to what functions the 
remote proc provides.

Rob
