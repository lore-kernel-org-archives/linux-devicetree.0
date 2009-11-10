From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: [PATCH 1/3] mpc52xx/wdt: OF property to enable the WDT on boot
Date: Tue, 10 Nov 2009 20:40:57 +0100
Message-ID: <1257882057.14374.1@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Linux PPC Development <linuxppc-dev@ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Wim Van Sebroeck <wim@iguana.be>
List-Id: devicetree@vger.kernel.org

Add the "wdt,on-boot" OF property as to reserve a GPT as WDT which may be a
requirement in safety-related (e.g. ISO 61508) applications.

Signed-off-by: Albrecht Dre=DF <albrecht.dress@arcor.de>
---

 Documentation/powerpc/dts-bindings/fsl/mpc5200.txt |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/fsl/mpc5200.txt b/Documenta=
tion/powerpc/dts-bindings/fsl/mpc5200.txt
index 8447fd7..1eecb06 100644
--- a/Documentation/powerpc/dts-bindings/fsl/mpc5200.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/mpc5200.txt
@@ -103,7 +103,20 @@ fsl,mpc5200-gpt nodes
 ---------------------
 On the mpc5200 and 5200b, GPT0 has a watchdog timer function.  If the board
 design supports the internal wdt, then the device node for GPT0 should
-include the empty property 'fsl,has-wdt'.
+include the empty property 'fsl,has-wdt'.  Note that this does not activate
+the watchdog.  The timer will function as a GPT if the timer api is used, =
and
+it will function as watchdog if the watchdog device is used.  The watchdog
+mode has priority over the gpt mode, i.e. if the watchdog is activated, any
+gpt api call to this timer will fail with -EBUSY.
+
+If you add the property
+	wdt,on-boot =3D <n>;
+GPT0 will be marked as in-use watchdog, i.e. blocking every gpt access to =
it.
+If n>0, the watchdog is started with a timeout of n seconds.  If n=3D0, the
+configuration of the watchdog is not touched.  This is useful in two cases:
+- just mark GPT0 as watchdog, blocking gpt accesses, and configure it late=
r;
+- do not touch a configuration assigned by the boot loader which supervises
+  the boot process itself.
 =

 An mpc5200-gpt can be used as a single line GPIO controller.  To do so,
 add the following properties to the gpt node:
