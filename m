From: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6] pstore/ram: Add ramoops support for the Flattened
 Device Tree.
Date: Sun, 16 Sep 2012 23:23:03 -0700
Message-ID: <20120917062302.GA768@lizard>
References: <1347042576-17675-1-git-send-email-bfreed@chromium.org>
 <20120908052907.GA4724@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120908052907.GA4724@lizard>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bryan Freed <bfreed-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 07, 2012 at 10:29:10PM -0700, Anton Vorontsov wrote:
> On Fri, Sep 07, 2012 at 11:29:36AM -0700, Bryan Freed wrote:
> > When called with a non-zero of_node, fill out a new ramoops_platform_data
> > with data from the specified Flattened Device Tree node.
> > Update ramoops documentation with the new FDT interface.
> > Update devicetree/binding documentation with pstore/ramoops.txt.
> 
> Thanks for your work, Bryan! There were a few issues, I fixed
> them myself but I need your confirmation if you're OK w/ all
> the changes.
[...]
> So, the resulting patch is down below. But I have not pushed
> it out yet, I'm waiting for your sign off. If you're OK with the
> changes, please reply with
> 'Signed-off-by: Bryan Freed <bfreed-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>'

Bryan, have you had a chance to look into this?

Thanks,
Anton.
