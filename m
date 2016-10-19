From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V5 00/10] dmaengine: qcom_hidma: add MSI interrupt support
Date: Wed, 19 Oct 2016 19:04:06 +0530
Message-ID: <20161019133406.GO2467@localhost>
References: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, timur@codeaurora.org, cov@codeaurora.org, agross@codeaurora.org, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 01:25:05AM -0400, Sinan Kaya wrote:
> The new version of the HW supports MSI interrupts instead of wired
> interrupts. The MSI interrupts are especially useful for the guest machine
> execution. The wired interrupts usually trap to the hypervisor and then are
> relayed to the actual interrupt.
> 
> The MSI interrupts can be directly fed into the interrupt controller.
> 
> Adding a new OF compat string (qcom,hidma-1.1) and ACPI string (QCOM8062)
> to distinguish newer HW from the older ones.

I was only able to apply 6 patches in this series. Which tree were these
generated against?

Please rebase rest..

-- 
~Vinod
