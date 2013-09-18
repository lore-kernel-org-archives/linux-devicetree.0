From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 20/28] arm64: set initrd_start/initrd_end for fdt scan
Date: Tue, 17 Sep 2013 22:36:51 -0500
Message-ID: <20130918033651.3FA9AC42CA8@trevor.secretlab.ca>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
 <1379372965-22359-21-git-send-email-robherring2@gmail.com>
 <8639E68F-4CCB-4E34-82BF-18EDA98BB978@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8639E68F-4CCB-4E34-82BF-18EDA98BB978@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robherring2@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2013 09:50:04 +0100, Catalin Marinas <catalin.marinas@arm.com> wrote:
> On 17 Sep 2013, at 00:09, Rob Herring <robherring2@gmail.com> wrote:
> > From: Rob Herring <rob.herring@calxeda.com>
> > 
> > In order to unify the initrd scanning for DT across architectures, make
> > arm64 use initrd_start and initrd_end instead of the physical addresses.
> > 
> > Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Grant Likely <grant.likely@linaro.org>
