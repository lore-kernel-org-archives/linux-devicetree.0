From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH resend] ARM: dts: atlas7: Use generic uart-has-rtscts DT
 property
Date: Wed, 7 Mar 2018 16:35:52 +0100
Message-ID: <CAK8P3a1EjwDSZooPvY-9jv1gsRBzCFsQifg-erEpiK52O9jC+A@mail.gmail.com>
References: <1519999365-15201-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519999365-15201-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: DTML <devicetree@vger.kernel.org>, Barry Song <baohua@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 2, 2018 at 3:02 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As of commit 7f60830ab1511d94 ("serial: sirf: Use generic
> uart-has-rtscts DT property property"), the SiRF UART driver recognizes
> the generic "uart-has-rtscts" DT property, deprecating the
> vendor-specific "sirf,uart-has-rtscts" DT property. Hence replace the
> latter by the former in all DTS files.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Pulled into next/dt, thanks!
