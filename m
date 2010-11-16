From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/5] Series short description
Date: Tue, 16 Nov 2010 12:49:43 -0800
Message-ID: <20101116204917.12146.39851.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following series implements a set of changes to refactor dts (device tree
source) files for systems using the mpc5200b SoC.

The dtc changes allow a base dts to be defined in a common dts file included
with '/include/ <filename>'. This base dts can then be updated and modified
by merging in a second device tree defined in the system specific dts file.

The rest of the changes are the refactoring of the mpc5200b dts files.

---

John Bonesio (5):
      scripts: dtc: Merge in changes from the dtc repository
      powerpc/5200: dts: rename nodes to prepare for refactoring dts files
      powerpc/5200: dts: remove unused properties
      powerpc/5200: dts: Remove incorrect combatible strings
      powerpc/5200: dts: refactor dts files


 arch/powerpc/boot/dts/cm5200.dts    |  198 +++----------------------
 arch/powerpc/boot/dts/digsy_mtc.dts |  179 +++--------------------
 arch/powerpc/boot/dts/lite5200b.dts |  210 ++-------------------------
 arch/powerpc/boot/dts/media5200.dts |  216 +++------------------------
 arch/powerpc/boot/dts/motionpro.dts |  198 +++----------------------
 arch/powerpc/boot/dts/mpc5200b.dtsi |  276 +++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/mucmc52.dts   |  176 ++++++----------------
 arch/powerpc/boot/dts/pcm030.dts    |  201 ++-----------------------
 arch/powerpc/boot/dts/pcm032.dts    |  205 ++------------------------
 arch/powerpc/boot/dts/uc101.dts     |  162 ++++-----------------
 10 files changed, 499 insertions(+), 1522 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/mpc5200b.dtsi

-- 
Signature
