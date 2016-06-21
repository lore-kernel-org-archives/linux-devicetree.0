From: Duc Dang <dhdang@apm.com>
Subject: Warning when compiling DTB on X-Gene platform with dtc 1.4.1-g53bf130b
Date: Tue, 21 Jun 2016 02:02:44 -0700
Message-ID: <CADaLNDnfH8Weo=9jVNAW7LQCvAw23-z5fafwWcer4FSKeYH=ug@mail.gmail.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

I got warning on unit_address_vs_reg similar to this
https://lkml.org/lkml/2016/3/7/43 when using v4.7-rc2 dtc to build dtb
for X-Gene Mustang:

dhdang@xgene-next=>./scripts/dtc/dtc -O dtb -R 16 -o mustang.dtb
arch/arm64/boot/dts/apm/apm-mustang.dts
  Warning (unit_address_vs_reg): Node /soc/reboot@17000014 has a unit
name, but no reg property
  Warning (unit_address_vs_reg): Node /memory has a reg or ranges
property, but no unit name
  Warning (unit_address_vs_reg): Node /gpio-keys/button@1 has a unit
name, but no reg property

There are nodes that I cannot change the node-name due to backward
compatible with old firmware reason (/soc/reboot@17000014 as an
example). Is there any other way to avoid the warning?

Regards,
Duc Dang.
