From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 2/2] ARM: davinci_all_defconfig: enable
 SYSCON_REBOOT_MODE
Date: Fri, 23 Feb 2018 17:24:12 +0530
Message-ID: <ce54ca3f-2bef-8001-19d9-6e493f92fed9@ti.com>
References: <1515724191-30499-1-git-send-email-david@lechnology.com>
 <1515724191-30499-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515724191-30499-3-git-send-email-david@lechnology.com>
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
To: David Lechner <david@lechnology.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 12 January 2018 07:59 AM, David Lechner wrote:
> This enables SYSCON_REBOOT_MODE as a module. This is used by LEGO
> MINDSTORMS EV3 to reboot into a special firmware update mode.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Applied to v4.17/defconfig

Thanks,
Sekhar
