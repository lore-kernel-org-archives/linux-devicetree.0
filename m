From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] Model SMPS10 regulator
Date: Thu, 20 Jun 2013 14:07:36 +0530
Message-ID: <1371717458-10307-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Palmas has SMPS10 regulator which can generate two voltage level 3.75 and 5V.
This SMPS10 has two outputs OUT1 and OUT2 and having one input IN1.

SMPS10-OUT2 is always connected to SMPS10-IN1 via following logic:
- Through parasitic diode (no sw control)
- In bypass mode (bit  configuration is there to enable/disable Bypass)
- In Boost mode (bit configuration is there to enable/disable Boost mode)

SMPS10-OUT1 is connected to the SMPS10-OUT2 pin through Switch (SW control
for enabling/disabling this switch).

There currently doesn't exist a property to indicate if the regulator
supports bypass mode. So added a property to indicate if the regulator
supports bypass mode. Also modified of_get_regulation_constraints() 
to check for that property and set appropriate constraints.

The second patch models SMPS10 as two regulators, SMPS10-OUT1 and SMPS10-OUT2.

Tested regulator enable of SMPS10-OUT1.
Dint test bypass mode.

Kishon Vijay Abraham I (2):
  regulator: of: Added a property to indicate bypass mode support
  regulator: palmas: model SMPS10 as two regulators

 .../devicetree/bindings/regulator/regulator.txt    |    1 +
 drivers/regulator/of_regulator.c                   |    3 ++
 drivers/regulator/palmas-regulator.c               |   39 ++++++++++++++++++--
 include/linux/mfd/palmas.h                         |    9 +++--
 4 files changed, 44 insertions(+), 8 deletions(-)

-- 
1.7.10.4
