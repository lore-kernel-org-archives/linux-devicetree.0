From: rvaswani@codeaurora.org
Subject: [DT] API to determine if interrupt is PPI or SPI ?
Date: Thu, 26 Jul 2012 12:18:41 -0700 (PDT)
Message-ID: <53a41d02c4c4c24bdab47667183891bf.squirrel@www.codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, davidb@codeaurora.org, grant.likely@secretlab.ca
Cc: linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

We can specify the interrupt information in the device tree using the arm
gic convention.
Is there an API to read directly the 1st cell and determine if an
interrupt is a PPI or a SPI ? This information is directly relevant to the
driver because it needs to call request_irq or request_percpu_irq based on
this data.

How should this be done ideally ?

Thanks,
Rohit

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
--
