From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: da850-evm/lcdk: Fixes for audio
 descriptions
Date: Wed, 19 Dec 2018 19:21:49 +0530
Message-ID: <c24b0b20-7b71-af1a-9cea-de61781b692d@ti.com>
References: <20181219114727.6865-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219114727.6865-1-peter.ujfalusi@ti.com>
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
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 19/12/18 5:17 PM, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v1s (regulator fixes):
> - Card name fixes

These look good to me. But since these issues are not v4.20 regressions,
I will send them for v4.21 once -rc1 comes out.

> - analog mic support for da850-lcdk

This one I might hold till v4.22.

> 
> The series fixes warnings regarding to regulator voltages and debugfs directory
> creation.

Thanks,
Sekhar
