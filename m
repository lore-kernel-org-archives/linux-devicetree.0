From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] arm64: dts: replace 'linux,
 stdout-path' with 'stdout-path'
Date: Wed, 7 Mar 2018 15:30:28 +0100
Message-ID: <CAK8P3a3j+VE8eRPXx--m_y46f45PbKVH1B51VGmpkXmnjONRdA@mail.gmail.com>
References: <20180228224116.2596-1-robh@kernel.org>
 <20180228224116.2596-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180228224116.2596-2-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 11:41 PM, Rob Herring <robh@kernel.org> wrote:
> 'linux,stdout-path' has been deprecated for some time in favor of
> 'stdout-path'. Now dtc will warn on occurrences of 'linux,stdout-path'.
> Search and replace the one occurrence with 'stdout-path'.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to next/dt as well, thanks!

     Arnd
