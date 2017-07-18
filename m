From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] sbus: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 14:51:53 -0700 (PDT)
Message-ID: <20170718.145153.1446387361078073279.davem@davemloft.net>
References: <20170718214339.7774-47-robh@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-47-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Jul 2017 16:43:27 -0500

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: David S. Miller <davem@davemloft.net>
