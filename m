From: "Li Yang-R58472" <LeoLi@freescale.com>
Subject: [RFC] More compatibles or more quirk properties
Date: Fri, 6 Mar 2009 15:09:48 +0800
Message-ID: <3A45394FD742FA419B760BB8D398F9ED29E274@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: devicetree-discuss@ozlabs.org
Cc: linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

I'm running into a dilemma choosing between two approaches of defining device tree binding.  Let's say if we have several chips with a similar SoC block, but each of them have different quirks.  If I define different compatibles for each of the chips, the driver will have a longer match table and thus bloat the device matching process.  Or we can use a same compatible for all of them and  define properties for each of the quirks.  But it somewhat bloats the device tree.  I'm more prone to the second solution, but I do want to hear what you guys think about it.

- Leo
