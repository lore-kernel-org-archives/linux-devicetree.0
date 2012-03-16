From: Kumar Gala <galak@kernel.crashing.org>
Subject: issues calling of_platform_bus_probe() twice
Date: Fri, 16 Mar 2012 16:21:19 -0500
Message-ID: <31B4E554-FA95-431D-B353-92680CD14A0A@kernel.crashing.org>
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "devicetree-discuss@lists.ozlabs.org Discuss" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, Timur Tabi <timur@freescale.com>
List-Id: devicetree@vger.kernel.org

Guys,

Are you aware of any reason that we can't call of_platform_bus_probe() or multiple times.  Timur's run into an issue in which all devices don't get registered properly if we call of_platform_bus_probe() times with different of_device_id struct's.

- k
