From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: da850-lego-ev3: Add node for reboot modes
Date: Fri, 23 Feb 2018 17:21:28 +0530
Message-ID: <08386992-0df8-2db7-76d6-98bda137bb49@ti.com>
References: <1515724191-30499-1-git-send-email-david@lechnology.com>
 <1515724191-30499-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515724191-30499-2-git-send-email-david@lechnology.com>
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
> This adds a new node for reboot modes on LEGO MINDSTORMS EV3. The EV3's
> bootloader looks for a magic number in the ARM local RAM and if found,
> it will boot into a special firmware update mode where the flash memory
> can be written via USB.
> 
> This has been testing working using the command:
> 
>     # systemctl reboot loader
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Added to v4.17/dt

Thanks,
Sekhar
