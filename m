From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v6 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Tue, 17 Sep 2019 02:33:41 +0000
Message-ID: <DB8PR04MB682662CA68F9F21F6DB82F72F18F0@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190821031537.46824-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821031537.46824-1-ran.wang_1@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>
Cc: Biwen Li <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rafael,

On Wednesday, August 21, 2019 11:16, Ran Wang wrote:
> 
> Some user might want to go through all registered wakeup sources and doing
> things accordingly. For example, SoC PM driver might need to do HW
> programming to prevent powering down specific IP which wakeup source
> depending on. So add this API to help walk through all registered wakeup source
> objects on that list and return them one by one.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v6:
> 	- Add wakeup_source_get_star() and wakeup_source_get_stop() to
> aligned
> 	with wakeup_sources_stats_seq_start/nex/stop.

How about this version, could you please give any comment? Thanks.

Regards,
Ran 

<snip>
