From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/7] of: Add of_property_match_string() to find index into
 a string list
Date: Fri, 06 Apr 2012 21:22:34 -0700
Message-ID: <20120407042234.1C8093E2FE9@localhost>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331680947-29861-4-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, 13 Mar 2012 18:22:23 -0500, Rob Herring <robherring2@gmail.com> wrote:
> From: Grant Likely <grant.likely@secretlab.ca>
> 
> Add a helper function for finding the index of a string in a string
> list property.  This helper is useful for bindings that use a separate
> *-name property for attaching names to tuples in another property such
> as 'reg' or 'gpios'.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

BTW, this patch got merged for v3.4 so you'll be able to drop it in
the next posting.

g.
