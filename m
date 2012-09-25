From: "Markus Mayer" <mmayer@broadcom.com>
Subject: [PATCH 0/1] Fix segfault in DTC
Date: Tue, 25 Sep 2012 10:58:08 -0700
Message-ID: <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
References: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jon Loeliger <jdl@jdl.com>, Markus Mayer <mmayer@broadcom.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

As suggested on linux-arm-kernel, I am copying devicetree-discuss, as well
as David and Jon on this thread. Please let me know your thoughts.

Regards,
-Markus

Markus Mayer (1):
  Fix segfault in dtc when empty input file is given.

 scripts/dtc/treesource.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

-- 
1.7.5.4
