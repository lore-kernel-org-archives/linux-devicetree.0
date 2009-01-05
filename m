From: "Li Yang" <LeoLi@freescale.com>
Subject: The usage of compatible 'simple-bus'
Date: Mon, 5 Jan 2009 18:27:39 +0800
Message-ID: <3A45394FD742FA419B760BB8D398F9ED0B37E7__15077.1179506139$1231151368$gmane$org@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi all,

I got an assumption from the existing device trees that having 'simple-bus' in the compatible property of a node means that all child nodes should be added as of_platform_device in platform initialization phase.  No matter it represents a bus in common sense or not.  Is this truly the case?  Shall we document this?

- Leo
