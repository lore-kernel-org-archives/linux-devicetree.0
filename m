From: Timur Tabi <timur@tabi.org>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party drivers
Date: Sun, 28 Aug 2016 15:36:11 -0500
Message-ID: <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
References: <57BDAF2E.10502@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57BDAF2E.10502@laposte.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Frias <sf84@laposte.net>
Cc: devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 9:29 AM, Sebastian Frias <sf84@laposte.net> wrote:
>
> If this is really not possible, it forces the SoC manufacturer to expose
> those properties in a different way, thus wasting a (seemingly) perfectly
> fine way of doing so: the DT and its documentation.

When you submit a new driver upstream, that patch also includes the
new device tree nodes and documentation for those nodes.  Everything
is peer-reviewed together.  I don't understand what you think the
problem is.
