From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4] of: add functions to count number of elements in a
 property
Date: Wed, 05 Feb 2014 12:06:52 +0000
Message-ID: <20140205120652.9B1A7C40A89@trevor.secretlab.ca>
References: <27256277.YJ687suYy5@phil> <
 CAL_JsqJord1OOjwcKk1jqF5o+XO3uw+Lc4ATtQacgwZWAoQq1g@mail.gmail.com> <
 20140204173034.2D899C4050F@trevor.secretlab.ca> <13514940.URVnEJ4NF0@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6523141350165008624=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <13514940.URVnEJ4NF0@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============6523141350165008624==
Content-Type: text/plain

On Tue, 04 Feb 2014 19:48:17 +0100, Heiko Stübner <heiko@sntech.de> wrote:
> Hi Grant,
> 
> On Tuesday, 4. February 2014 17:30:34 Grant Likely wrote:
> > On Sat, 18 Jan 2014 09:07:30 -0600, Rob Herring <robherring2@gmail.com> 
> wrote:
> > > On Sat, Jan 18, 2014 at 6:02 AM, Heiko StÃ¼bner <heiko@sntech.de> wrote:
> > > > The need to know the number of array elements in a property is
> > > > a common pattern. To prevent duplication of open-coded implementations
> > > > add a helper static function that also centralises strict sanity
> > > > checking and DTB format details, as well as a set of wrapper functions
> > > > for u8, u16, u32 and u64.
> > > > 
> > > > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > 
> > > Looks good. Do you plan to convert some users to use this?
> > 
> > I'll take that as an acked-by. Merged, thanks.
> 
> before you taking this patch, I was planning on simply sending this as part of 
> my rockchip-smp series - as I'm currently the only user of it :-) .
> 
> This going through your tree is most likely the better way, but now I need it 
> to somehow make its way into arm-soc too ... I guess some sort of stable 
> branch arm-soc could pull?

Nah, I'll drop it from my tree. Add my acked-by and merge it via
arm-soc.

g.



--===============6523141350165008624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6523141350165008624==--
