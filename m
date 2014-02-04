From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4] of: add functions to count number of elements in a
 property
Date: Tue, 04 Feb 2014 17:30:34 +0000
Message-ID: <20140204173034.2D899C4050F@trevor.secretlab.ca>
References: <27256277.YJ687suYy5@phil> <1434798.oSb68sYmYT@phil> <
 CAL_JsqJ_St=OegpexzrTGXwmOYCz4YeWk_1S+R_q6NajmmPqSA@mail.gmail.com> <
 5115255.DrcMbtXc1P@phil> <
 CAL_JsqJord1OOjwcKk1jqF5o+XO3uw+Lc4ATtQacgwZWAoQq1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5995396297874994030=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJord1OOjwcKk1jqF5o+XO3uw+Lc4ATtQacgwZWAoQq1g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============5995396297874994030==
Content-Type: text/plain

On Sat, 18 Jan 2014 09:07:30 -0600, Rob Herring <robherring2@gmail.com> wrote:
> On Sat, Jan 18, 2014 at 6:02 AM, Heiko Stübner <heiko@sntech.de> wrote:
> > The need to know the number of array elements in a property is
> > a common pattern. To prevent duplication of open-coded implementations
> > add a helper static function that also centralises strict sanity
> > checking and DTB format details, as well as a set of wrapper functions
> > for u8, u16, u32 and u64.
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> 
> Looks good. Do you plan to convert some users to use this?

I'll take that as an acked-by. Merged, thanks.

g.



--===============5995396297874994030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5995396297874994030==--
