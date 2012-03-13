From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/1] of: add NULL parameter check for
 of_device_is_available
Date: Tue, 13 Mar 2012 13:34:19 -0700 (PDT)
Message-ID: <20120313.133419.2242081944811028058.davem@davemloft.net>
References: <1331638805-17136-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331638805-17136-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: b29396@freescale.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <b29396@freescale.com>
Date: Tue, 13 Mar 2012 19:40:05 +0800

> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> This function will return 1 even the device node passed in
> is NULL which is a little error-prone.
> Change to return 0 if the device node passed in is NULL.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>

I think this is a hard error and therefore BUG_ON(!device) is
more appropriate.
