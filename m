From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing
Date: Tue, 05 Nov 2013 16:18:08 +0100
Message-ID: <2177804.l4VGDTRFDu@amdc1227>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <20131101185401.B298FC40868@trevor.secretlab.ca>
 <20131104050455.GA3651@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131104050455.GA3651@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Following two patches seem to fully fix interrupt parsing issues,
at least on Exynos 4210 Trats board. They must be applied without
Grant's fixup patch, as it doesn't seem to fully solve the problem.

Tomasz Figa (2):
  of: irq: Fix interrupt-map entry matching
  of: irq: Check for reg property presence only when parsing
    interrupt-map

 drivers/of/irq.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
1.8.4.2
