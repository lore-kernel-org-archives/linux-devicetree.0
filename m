From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2 4/4] pci: Add support for creating a generic
 host_bridge from device tree
Date: Sun, 02 Mar 2014 12:23:35 +1100
Message-ID: <1393723415.12039.1.camel@pasglop>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com>
 <1393506402-11474-5-git-send-email-Liviu.Dudau@arm.com>
 <18746655.qWHLpMg2Yy@wuerfel> <1393543924.14012.56.camel@pasglop>
 <20140228095559.GU1692@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140228095559.GU1692@e106497-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-02-28 at 09:55 +0000, Liviu Dudau wrote:
> The next phase will be to see how much of the pci_controller structure can move
> into the generic code and reduce its size. I do suffer from not having a PowerPC
> platform where I can test the changes, but I can produce some compiled code that
> someone can test.

Ok, we can probably start from there. I think the right approach is to actually
kill pci_controller by merging it with the new host bridge structure.

Most of the resources are there now, we need to move the rest. We probably will
need a way to attach platform specific bits to it though, and a few hooks to
populate them but that isn't terribly hard.

Cheers,
Ben.
