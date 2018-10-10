From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH] ARM: dts: imx6qdl-udoo: Add Pincfgs for UART4
Date: Wed, 10 Oct 2018 23:57:14 +0200
Message-ID: <b032e50b-c189-8f9f-739e-30afb6ddfb33@maciej.szmigiero.name>
References: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
 <20181008060500.GI3587@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181008060500.GI3587@dragon>
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
To: Shawn Guo <shawnguo@kernel.org>, Markus Kueffner <kueffner.markus@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08.10.2018 08:05, Shawn Guo wrote:
> Add a few udoo board users for comment.
> 
> On Thu, Oct 04, 2018 at 04:33:59PM +0200, Markus Kueffner wrote:
>> From: Markus Kueffner <kueffner.markus@gmail.com>
>>
>> Add Pincfgs for UART4 to enable Communication with the onboard SAM3X

Although I can't test this patch on a real board, verifying it with
UDOO schematic and docs suggests that this change does make sense.

Maciej
