From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] mtd: partitions: Add RedBoot FIS DT bindings
Date: Sun, 28 Oct 2018 20:24:52 +0100
Message-ID: <CACRpkdbThqKUTvN294iKad0z4or5FAJioR08b9n5UwbF=hCCDQ@mail.gmail.com>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
 <20181019070622.26661-2-linus.walleij@linaro.org>
 <CACRpkda=1CNzZe1ACGm9nwVDGbHdAxhWzpqcANs-KKBhPpNF-w@mail.gmail.com>
 <20181025190825.GA15870@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181025190825.GA15870@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Mark Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 9:08 PM Rob Herring <robh@kernel.org> wrote:

> It's all fine for me.

Thanks.

> I was only going to comment is Redboot still a thing? :)

Yep. What I've learned recently is that some of the stuff we
support has way longer lifecycles than we expected. There are
brand new devices shipping using the RedBoot partition table
as we speak. It seems to be coming from places like Taiwan.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
